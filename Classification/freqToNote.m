function notes = freqToNote(frequencies, freq_resolution)
    note_names = {'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'};
    num_notes = length(note_names);

    notes = cell(size(frequencies));

    for i = 1:length(frequencies)
        % finding the closest note to the frequency
        [~, index] = min(abs((1:num_notes) * freq_resolution - frequencies(i)));
        notes{i} = note_names{index};
    end
end