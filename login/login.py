from config.config import ADMIN_USERNAME, ADMIN_PASSWORD

def login(username, password):
    return username == ADMIN_USERNAME and password == ADMIN_PASSWORD

def logout():
    return True


