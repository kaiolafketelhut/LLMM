function main(varargin)
    % Build the command string with arguments
    args = strjoin(varargin, ' ');
    cmd = sprintf('./dist/D16S %s', args);
    
    % Execute and capture status/output
    [status, cmdout] = system(cmd);
    disp(cmdout);
    
    % Exit with the binary's status code
    exit(status);
end
