function processNotesFeedback(fundamental_frequencies, fundamental_amplitudes, notes, expected_notes)

    function ang = angle(u, v)
        ang = acos(dot(u, v) / (norm(u) * norm(v)));
    end

    % y position
    function classify = error_classification(u, v)
        if u(2) > v(2)
            classify = -1;
        elseif u(2) < v(2)
            classify = 1;
        else
            classify = 0;
        end
    end

    % feedback
    function feedback = provideFeedback(u, expected_notes)
        feedback = cell(size(u, 1), 1);

        for j = 1:size(u, 1)
            expected_vector = [expected_notes(j, 1), expected_notes(j, 2)];
            ang = angle(u(j, :), expected_vector);
            classify = error_classification(u(j, :), expected_vector);

            if (ang ~= 0) && (classify == -1)
                feedback{j} = sprintf('You are %.2f%% off, play a little quieter', 100 * ang);
            elseif (ang ~= 0) && (classify == 1)
                feedback{j} = sprintf('You are %.2f%% off, play a little louder', 100 * ang);
            else
                feedback{j} = 'Perfect';
            end
        end
    end

    % feedback vector
    u = [fundamental_frequencies, fundamental_amplitudes];

    % feedback based on angles
    feedback = provideFeedback(u, expected_notes);

    % display feedback
    fprintf('Feedback:\n');
    for j = 1:length(feedback)
        fprintf('%s\n', feedback{j});
    end
end