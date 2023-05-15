from bottle import post, route, run, request, template

@route('/')
@route('/login')
def login():
    return  '''
            <form action='/login' method='post'>
                Username: <input name='username' type='text' />
                Password: <input name='password' type='password' />
                <input value='Login' type='submit' />
            </form> 
            '''

@route('/board') # /board?id=1&page=5
def display_board():
    board_id = request.query.id
    board_page = request.query.page or '1'
    return template('Board ID:{{id}} (Page {{page}})', id=board_id, page=board_page)

def check_login(username, password):
    if username == 'pi' and password == 'raspberry':
        return True
    else:
        return False

@post('/login') # or @route('/login', method='POST')
def login_auth():
    username = request.forms.get('username')
    password = request.forms.get('password')
    if check_login(username, password):
        return '<p>User %s has been successfully logged in!</p>' % username
    else:
        return '<p>Login failed!</p>'

run(host='192.168.77.35', port=80)
