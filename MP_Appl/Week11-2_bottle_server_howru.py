from bottle import route, run

@route('/')
@route('/hello')
def hello_world():
    return 'Hello World!'

@route('/howru')
def howru():
    return 'Hi, How are you?'

run(host='192.168.77.35', port=80)
