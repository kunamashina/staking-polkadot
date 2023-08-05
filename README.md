# Technical Assignement for Staking Facilities GmbH

This is the solution for the technical assignment for Staking Facilities GmbH in Munich by Kunic Ismar.

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

1. Create a user ubuntu with home directory /home/ubuntu on your local server and add it to sudoers
2. Clone this repository
3. Run the shell script install_requirements.sh
4. Navigate to the ansible directory and run the first playbook to configure access to the AWS
5. Run the second playbook to deploy the required infrastructure in AWS
6. Run the third playbook to generate EC2 keypair and save it to the user's home directory
7. Run the fourth playbook to install Polkadot binary and systemd service on the EC2 instances

## License

BSD

## Author Information

Kunic Ismar
ismuskuna@gmail.com
