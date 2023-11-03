u = [1 1; 1 1; 1 1];
v = [1 1; 1 1; 1 2];

feedback(u, v);

% Function that finds the angle between two vectors
function ang = angle(u, v)
    ang = acos(dot(u, v) / (norm(u) * norm(v)));
end

% Function that classifies the y position of vectors
function classify = error_classification(u, v)
    % The following conditions return -1, 1, or 0 based on whether the
    % components of the y components are greater or less than the 
    % expected signal output.
    if u(2) > v(2)
        classify = -1;
    elseif u(2) < v(2)
        classify = 1;
    else
        classify = 0;
    end
end

% Function that provides feedback data based on user input compared with the
% expected input
function feedback(u, v)
    % Angles is a cell array of cell arrays containing the angle between vectors
    % and a number giving information about whether a signal's y component is
    % greater than or less than the other's.
    angles = {};

    % This loop appends angles between vectors to the cell array 'angles'
    for i = 1:size(u, 1)
        ang = angle(u(i, :), v(i, :));
        classify = error_classification(u(i, :), v(i, :));
        angles{end+1} = {ang, classify};
    end

    % This loop gives feedback to the user based on the angle between the
    % input vector and expected as well as whether the input vector's y
    % component is greater than, less than, or equal to the y component of
    % the expected vector
    for j = 1:length(angles)
        if (angles{j}{1} ~= 0) && (angles{j}{2} == -1)
            fprintf('You are %.2f%% off, play a little quieter\n', 100 * angles{j}{1});
        elseif (angles{j}{1} ~= 0) && (angles{j}{2} == 1)
            fprintf('You are %.2f%% off, play a little louder\n', 100 * angles{j}{1});
        else
            disp('Perfect');
        end
    end
end