function [x, y] = parse_data(filename)
    % file input format:
    % n
    % x0 x1 ... xn
    % y0 y1 ... yn

    % TODO 1: Open the file for reading

    % TODO 2: Read n, x, y from the file

    % TODO 3: Close the file
    file_id = fopen(filename, 'rt');

    % Citim n, x, y din fisier
    n = fscanf(file_id, '%d', 1);
    x = fscanf(file_id, '%d', n + 1);
    y = fscanf(file_id, '%d', n + 1);

    % convertim x si y in vectori coloana(daca este necesar)
    if size(x, 1) == 1
        x = x';
    end
    if size(y, 1) == 1
        y = y';
    end

    fclose(file_id);
end