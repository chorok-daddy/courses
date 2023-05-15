from bottle import route, run

@route('/')
def hello_world():
    return 'Hello World!'

run(host='192.168.77.35', port=80)