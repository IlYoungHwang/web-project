/**
 * 패스포트 설정 파일
 * 
 * 로컬 인증방식을 사용하는 패스포트 설정
 *
 * @date 2016-11-10
 * @author Mike
 */

var LocalStrategy = require('passport-local').Strategy;
var bcrypt = require('bcrypt-nodejs');
module.exports = new LocalStrategy({
		usernameField : 'id',
		passwordField : 'password',
		passReqToCallback : true   // 이 옵션을 설정하면 아래 콜백 함수의 첫번째 파라미터로 req 객체 전달됨
	}, function(req,id, password, done) {
	console.log('authUser 호출됨 : ' + id + ', ' + password);
	
    var pool = req.app.get('pool');
	// 커넥션 풀에서 연결 객체를 가져옴
	pool.getConnection(function(err, conn) {
        if (err) {
        	if (conn) {
                conn.release();  // 반드시 해제해야 함
            }
            callback(err, null);
            return;
        }   
        console.log('데이터베이스 연결 스레드 아이디 : ' + conn.threadId);
    
        var tablename = '관리자';
    
        // SQL 문을 실행합니다.
        var exec = conn.query("select * from ?? where 아이디 = ?", [tablename, id], function(err, rows) {
            conn.release();  // 반드시 해제해야 함
            console.log('실행 대상 SQL : ' + exec.sql);
            
            if (rows.length > 0) {
                bcrypt.compare(password, rows[0].비밀번호, function(err, res) {
                    if (res) {
                        console.log('아이디 [%s], 패스워드 [%s] 가 일치하는 사용자 찾음.', id, password);
                        return done(null,rows);
                    }
                    else {
                        return done(null, false, req.flash('loginMessage', '비밀번호가 맞지 않습니다.'));  
                    }
                });
            } else {
                return done(null, false, req.flash('loginMessage', '등록된 계정이 없습니다.'));  
            } 
        });

        conn.on('error', function(err) {      
            console.log('데이터베이스 연결 시 에러 발생함.');
            console.dir(err);
            
            return done(err, null);
      });
    });
});