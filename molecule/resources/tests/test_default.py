import os
import pytest

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']
).get_hosts('all')


@pytest.mark.parametrize("path", [
    ("/root/.gitconfig"),
    ("/root/.kshrc"),
    ("/root/.bashrc"),
    ("/root/.vimrc"),
    ("/etc/skel/.kshrc"),
    ("/etc/skel/.bashrc"),
    ("/etc/skel/.vimrc"),
])
def test_file_exists(host, path):
    file = host.file(path)
    assert file.exists
    return
