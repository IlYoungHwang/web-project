/**
 * 패스포트 설정 파일
 * 
 * 로컬 인증방식에서 회원가입에 사용되는 패스포트 설정
 *
 * @date 2016-11-10
 * @author Mike
 */

var LocalStrategy = require('passport-local').Strategy;
var bcrypt = require('bcrypt-nodejs');
module.exports = new LocalStrategy({
		usernameField : 'id',
		passwordField : 'password',
		passReqToCallback : true    // 이 옵션을 설정하면 아래 콜백 함수의 첫번째 파라미터로 req 객체 전달됨
	}, function(req,id, password, done) {
	console.log('authUser 호출됨 : ' + id + ', ' + password);
	
    var name = req.body.name || req.query.name;
    var phone = req.body.phone || req.query.phone;
    var position = req.body.position || req.query.position;
    
    var pool = req.app.get('pool');
	// 커넥션 풀에서 연결 객체를 가져옴
	pool.getConnection(function(err, conn) {
        if (err) {
        	if (conn) {
                conn.release();  // 반드시 해제해야 함
            }
            return done(err,null);    
        
        } else {
            
            
            bcrypt.hash(password, null, null, function(err, hash) {
                var data = {아이디:id, 비밀번호:hash, 이름:name, 전화번호:phone, 직책:position};
                // SQL 문을 실행합니다.
                var exec = conn.query("insert into 관리자 set ?", data, function(err, rows) {
                    conn.release();  // 반드시 해제해야 함
                    console.log('실행 대상 SQL : ' + exec.sql);
                    
                    if(!rows){
                        console.log(err + '기존에 계정이 있음.');
                        return done(null, false, req.flash('signupMessage','계정이 이미 있습니다.'));
                    }else{
                        
                        var result = [{
                            아이디: id,
                            비밀번호: hash,
                            이름: name,
                            전화번호: phone,
                            직책: position
                        }];

                        return done(null, result);
                    }
                });
            });
        }
        
        conn.on('error', function(err) {      
            console.log('데이터베이스 연결 시 에러 발생함.');
            console.dir(err);
            
            return done(err,null);
      });
    });
});