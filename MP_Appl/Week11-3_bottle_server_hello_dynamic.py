from bottle import route, run

@route('/string/<name>')
def hello_world(name):
    return 'Hello %s' % name

@route('/integer/<num:int>')
def hello_world(num):
    return 'Hello number %d' % num

run(host='192.168.77.35', port=80)