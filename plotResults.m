function plotResults(t, v, drag, F, e, v_ref)

    figure('Name', 'Descent Control Results', 'Position', [100 100 900 650])

    % ── 1. Velocity ──────────────────────────────────
    subplot(2,2,1)
    plot(t, v, 'b', 'LineWidth', 1.5)
    yline(v_ref, '--r', 'v_{ref}', 'LineWidth', 1.2)
    xlabel('Time (s)'); ylabel('v (m/s)')
    title('Velocity'); grid on

    % ── 2. Drag force ────────────────────────────────
    subplot(2,2,2)
    plot(t, drag, 'g', 'LineWidth', 1.5)
    xlabel('Time (s)'); ylabel('F_{drag} (N)')
    title('Aerodynamic Drag'); grid on

    % ── 3. Thrust ────────────────────────────────────
    subplot(2,2,3)
    plot(t, F, 'r', 'LineWidth', 1.5)
    xlabel('Time (s)'); ylabel('F_{thrust} (N)')
    title('Thrust (PID output)'); grid on

    % ── 4. Error ─────────────────────────────────────
    subplot(2,2,4)
    plot(t, e, 'm', 'LineWidth', 1.5)
    yline(0, '--k', 'LineWidth', 1)
    xlabel('Time (s)'); ylabel('e (m/s)')
    title('Error (v_{ref} - v)'); grid on

    sgtitle('Descent Velocity Control — Closed Loop', 'FontSize', 13)
end