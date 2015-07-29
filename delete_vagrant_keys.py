import digitalocean
from os import environ


def delete_keys():
    manager = digitalocean.Manager(token=environ["DIGITALOCEAN_ACCESS_TOKEN"])
    keys = manager.get_all_sshkeys()
    for key in keys:
        if key.name == "Vagrant":
            print "Deleting Key {}".format(key.id)
            key.destroy()

if __name__ == "__main__":
    delete_keys()