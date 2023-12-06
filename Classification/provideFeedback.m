function feedback = provideFeedback(angles)
    feedback = cell(length(angles), 1);
    for j = 1:length(angles)
        if (angles{j}{1} ~= 0) && (angles{j}{2} == -1)
            feedback{j} = sprintf('You are %.2f%% off, play a little quieter', 100 * angles{j}{1});
        elseif (angles{j}{1} ~= 0) && (angles{j}{2} == 1)
            feedback{j} = sprintf('You are %.2f%% off, play a little louder', 100 * angles{j}{1});
        else
            feedback{j} = 'Perfect';
        end
    end
end