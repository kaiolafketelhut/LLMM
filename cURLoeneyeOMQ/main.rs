use std::env;
use std::process::{self, Command};

fn main() {
    let args: Vec<String> = env::args().collect();
    
    let status = Command::new("./dist/D16S")
        .args(&args[1..])
        .status();

    match status {
        Ok(exit_status) => {
            let code = exit_status.code().unwrap_or(1);
            process::exit(code);
        }
        Err(err) => {
            eprintln!("Failed to execute D16S binary: {}", err);
            process::exit(1);
        }
    }
}
