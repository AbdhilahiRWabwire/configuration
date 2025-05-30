use std::{
    io::{Error, StdoutLock, Write, stdout},
    process::{Command, ExitCode, Output},
    result::{
        Result,
        Result::{Err, Ok},
    },
};

// DNF System Release Upgrade
pub fn release_dnf() -> ExitCode {
    let dnf_release: Result<Output, Error> = Command::new("dnf")
        .arg("system-upgrade")
        .arg("download")
        .arg("--releasever=41")
        .output();
    let mut standard_output: StdoutLock = stdout().lock();

    match dnf_release {
        Ok(release) => {
            standard_output.write_all(&release.stdout).unwrap();
            writeln!(standard_output, "Status: {}", release.status).unwrap();
        }
        Err(error) => {
            eprintln!("Error Executing DNF System Release Upgrade: {}", error);
            return ExitCode::FAILURE;
        }
    };

    return ExitCode::SUCCESS;
}
