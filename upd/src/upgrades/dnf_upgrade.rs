use std::{
    process::{Command, ExitCode, Output},
    string::String,
};

// DNF Upgrade
pub fn upgrade_dnf() -> ExitCode {
    let dnf_upgrade: Output = Command::new("dnf")
        .arg("-y")
        .arg("upgrade")
        .output()
        .expect("DNF Upgrade Failed");

    println!(
        "Command Output: {:#?}",
        String::from_utf8(dnf_upgrade.stdout)
    );
    println!("Status: {:#?}", dnf_upgrade.status);
    println!(
        "Error (If Error): {:#?}",
        String::from_utf8(dnf_upgrade.stderr)
    );

    return ExitCode::SUCCESS;
}
