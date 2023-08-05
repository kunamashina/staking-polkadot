# Technical Assignement for Staking Facilities GmbH

This is the solution for the technical assignment for Staking Facilities GmbH in Munich by Kunić Ismar.

## Assignement requirements

Task Assignment: Polkadot Fullnode Deployment and Update Automation

Objective: Automate the deployment and update process for a Polkadot Fullnode using Terraform and Ansible.

Task Requirements:

    Create a repository on GitLab or GitHub for version control and collaboration.

    Use Terraform to create IAC files for provisioning two instances on your preferred provider (for example on AWS). You can find the requirements of a Polkadot node here: https://wiki.polkadot.network/docs/maintain-guides-how-to-validate-polkadot#reference-hardware

    Write an Ansible playbook to automate the deployment of the Polkadot binary v0.9.39-1 to the two instances. You can find information on it here: https://wiki.polkadot.network/docs/maintain-guides-how-to-validate-polkadot#installing-the-polkadot-binary

    The easiest way would be to take the pre-built binary provided. If you want to be fancy, you could build it yourself inside the playbook, though this is not required.

    Configure the playbook to create and manage a systemd service file that will run the Polkadot Fullnode.

    Write a brief description explaining how you would update the Polkadot nodes to v0.9.41 using your playbook

## Software requirements

Ansible Core & Terraform

## Variables

This solution is using Ansible role to install Polkadot binary and systemd service. All variables can be found in the following URL:
https://github.com/paritytech/ansible-galaxy/blob/main/roles/node/defaults/main.yml

## Dependencies

This solution depends on the following ansible role:
https://github.com/paritytech/ansible-galaxy/blob/main/roles/node/README.md

## How to use this solution

1. Create a user `ubuntu` with home directory `/home/ubuntu` on your local server and add it to sudoers
2. Clone this repository
3. Run the shell script install_requirements.sh from ansible folder
4. Run the first playbook (01_kunic_aws_access) to configure access to the AWS
5. Run the second playbook (02_kunic_terraform) to deploy the required infrastructure in AWS
6. Run the third playbook (03_kunic_keypair) to generate the private key and save it to the user's home directory
7. Run the fourth playbook (04_kunic_deploy_polkadot) to install Polkadot binary and systemd service on the EC2 instances

## How to update the Polkadot binary

To update the Polkadot binary you can simply replace the value of `node_binary_version` variable in the file 04_kunic_deploy_polkadot.yml with the desired version and run the playbook again.

CAUTION:
If you run into an error while restarting systemd service `error: unexpected argument '--ws-external' found after deploying a new version` you will need to manually remove this parameter from the file /etc/systemd/system/polkadot.service, reload the systemd daemon and start the service again.

## License

BSD

## Author Information

Kunić Ismar
ismuskuna@gmail.com
