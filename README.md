# Ansible Role: skel

An Ansible Role to configure the system skel files (/etc/skel) and update the root ones.

A `/root/.gitconfig` file is also created to avoid errors if the package `etckeeper` is installed.

[![Actions Status](https://github.com/tristan-weil/ansible-role-skel/workflows/molecule/badge.svg?branch=master)](https://github.com/tristan-weil/ansible-role-skel/actions)

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

Mandatory variables:

| Variable      | Description |
| :------------ | :---------- |

Optional variables:

| Variable      | Default | Description |
| :------------ | :------ | :---------- |
| skel_system_shell | bash        | the shell to use by default by new users |

## Example Playbook

    - hosts: 'webservers'
      roles:
        - role: 'ansible-role-skell'
          skel_system_shell: ksh

## Todo

None.

## Dependencies

None.

## Supported platforms

See [meta/main.yml](https://github.com/tristan-weil/ansible-role-skel/blob/master/meta/main.yml)

## License

See [LICENSE.md](LICENSE.md)
