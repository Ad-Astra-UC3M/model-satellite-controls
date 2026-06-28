% Main authors: Andrés Chiva 

clear; clc; close all;

% Parámetros físicos
%   m    masa total del quadrotor         [kg]
%   g    aceleración gravitatoria         [m/s²]
%   l    distancia rotor-centro de masa   [m]
%   k    constante de empuje              [N·s²/rad²]
%   b    constante de arrastre (drag)     [N·m·s²/rad²]
%   Ixx  inercia en roll                  [kg·m²]
%   Iyy  inercia en pitch                 [kg·m²]
%   Izz  inercia en yaw                   [kg·m²]

p.m   = 0.468;
p.g   = 9.81;
p.l   = 0.225;
p.k   = 2.980e-6;
p.b   = 1.140e-7;
p.Ixx = 4.856e-3;
p.Iyy = 4.856e-3;
p.Izz = 8.801e-3;

w_hov = p.m * p.g / (4 * p.k);

x0 = zeros(12, 1);

opts = odeset('RelTol', 1e-8, 'AbsTol', 1e-10);
[t, X] = ode45(@(t,x) eom(t, x, w_hov, p), [0 18], x0, opts);

plot_estados(t, X);
visualizar_3D(t, X);


function u = control(t, w_hov)
    % 0-3 s:  hover en el suelo
    % 3-8 s:  subida  
    % 8-18 s: bajada 
    if t < 3
        factor = 1.0;
    elseif t < 8
        factor = 1.15;
    else
        factor = 0.82;
    end
    u = factor * w_hov * ones(4, 1);
end


function dxdt = eom(t, x, w_hov, p)
    phi = x(4); theta = x(5); psi = x(6);
    xdot = x(7); ydot = x(8); zdot = x(9);
    pp = x(10); qq = x(11); rr = x(12);

    u = control(t, w_hov);
    u1=u(1); u2=u(2); u3=u(3); u4=u(4);

    sphi=sin(phi); cphi=cos(phi);
    sth=sin(theta); cth=cos(theta);
    spsi=sin(psi); cpsi=cos(psi);

    R = [cpsi*cth,  cpsi*sth*sphi - spsi*cphi,  cpsi*sth*cphi + spsi*sphi;
         spsi*cth,  spsi*sth*sphi + cpsi*cphi,  spsi*sth*cphi - cpsi*sphi;
        -sth,        cth*sphi,                   cth*cphi                 ];

    T         = p.k*(u1+u2+u3+u4);
    tau_phi   = p.l*p.k*(-u2+u4);
    tau_theta = p.l*p.k*(-u1+u3);
    tau_psi   = p.b*(-u1+u2-u3+u4);

    xi_ddot = (1/p.m)*([0;0;-p.m*p.g] + R*[0;0;T]);

    p_dot = (tau_phi   - (p.Izz-p.Iyy)*qq*rr) / p.Ixx;
    q_dot = (tau_theta - (p.Ixx-p.Izz)*pp*rr) / p.Iyy;
    r_dot = (tau_psi   - (p.Iyy-p.Ixx)*pp*qq) / p.Izz;

    Weta_inv = [1, sphi*tan(theta),  cphi*tan(theta);
                0, cphi,            -sphi;
                0, sphi/cth,         cphi/cth       ];
    eta_dot = Weta_inv * [pp; qq; rr];

    dxdt = [xdot; ydot; zdot; eta_dot; xi_ddot; p_dot; q_dot; r_dot];
end


function plot_estados(t, X)
    figure('Name', 'Estados', 'Position', [50 50 1000 600]);

    subplot(2,3,1);
    plot(t, X(:,3), 'LineWidth', 1.5);
    xlabel('t (s)'); ylabel('z (m)'); grid on;

    subplot(2,3,2);
    plot(t, X(:,1:2), 'LineWidth', 1.5);
    legend('x','y'); xlabel('t (s)'); ylabel('(m)'); grid on;

    subplot(2,3,3);
    plot(t, rad2deg(X(:,4:6)), 'LineWidth', 1.5);
    legend('\phi','\theta','\psi'); xlabel('t (s)'); ylabel('(°)'); grid on;

    subplot(2,3,4);
    plot(t, X(:,7:9), 'LineWidth', 1.5);
    legend('xdot','ydot','zdot'); xlabel('t (s)'); ylabel('(m/s)'); grid on;

    subplot(2,3,5);
    plot(t, X(:,10:12), 'LineWidth', 1.5);
    legend('p','q','r'); xlabel('t (s)'); ylabel('(rad/s)'); grid on;

    subplot(2,3,6);
    plot3(X(:,1), X(:,2), X(:,3), 'k', 'LineWidth', 1.5);
    hold on;
    scatter3(X(1,1), X(1,2), X(1,3), 60, 'g', 'filled');
    scatter3(X(end,1), X(end,2), X(end,3), 60, 'r', 'filled');
    xlabel('X'); ylabel('Y'); zlabel('Z'); grid on; axis equal;
end


function visualizar_3D(t, X)
    dt_a = 0.05;
    t_a  = t(1):dt_a:t(end);
    Xa   = interp1(t, X, t_a);
    N    = length(t_a);

    % Calcular aceleraciones lineales por diferencias finitas (para move)
    vel  = [Xa(:,7), Xa(:,8), Xa(:,9)];
    accel = gradient(vel', dt_a)';   % 3 columnas: ax, ay, az

    scene = uavScenario("UpdateRate", 1/dt_a, "StopTime", t_a(end));

    % eul2quat espera [yaw, pitch, roll]
    q0 = eul2quat([Xa(1,6), Xa(1,5), Xa(1,4)]);
    plat = uavPlatform("Quadrotor", scene, ...
                       "ReferenceFrame",      "ENU", ...
                       "InitialPosition",     Xa(1, 1:3), ...
                       "InitialOrientation",  q0);

    % eye(4) como offset: sin rotación adicional sobre el mesh
    % El mesh "quadrotor" en ENU ya apunta hacia arriba por defecto
    updateMesh(plat, "quadrotor", {2}, [0.2 0.5 1.0], eye(4));

    figure('Name', 'Quadrotor 3D', 'Position', [600 50 800 650]);
    ax = show3D(scene);
    axis(ax, 'equal');
    view(ax, 45, 25);
    zm = max(Xa(:,3));
    zlim(ax, [-0.2, zm + 0.5]);
    xlim(ax, [-0.5, 0.5]); ylim(ax, [-0.5, 0.5]);
    title(ax, '');
    hold(ax, 'on');
    traj_line = plot3(ax, Xa(1,1), Xa(1,2), Xa(1,3), 'b--', 'LineWidth', 1.2);

    setup(scene);

    for i = 1:N
        pos  = Xa(i, 1:3);
        vel_i  = Xa(i, 7:9);
        acc_i  = accel(i, :);
        % eul2quat: [yaw, pitch, roll]
        quat = eul2quat([Xa(i,6), Xa(i,5), Xa(i,4)]);
        angv = Xa(i, 10:12);

        % move requiere 16 elementos: [pos(3) vel(3) accel(3) quat(4) angvel(3)]
        move(plat, [pos, vel_i, acc_i, quat, angv]);

        advance(scene);
        show3D(scene, "Parent", ax, "FastUpdate", true);

        set(traj_line, 'XData', Xa(1:i,1), ...
                       'YData', Xa(1:i,2), ...
                       'ZData', Xa(1:i,3));
        drawnow limitrate;
        pause(dt_a * 0.6);
    end
end