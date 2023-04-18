package com.kbstar.service;

import com.kbstar.dto.UserDTO;
import com.kbstar.frame.MyDao;
import com.kbstar.frame.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("uservice")
public class UserService implements MyService<String, UserDTO> {
    @Autowired         //자동적으로 찾아서 주입시켜준다   //userMysql이랑 User랑 2개니깐,
                        // 뭘 가져올지를 모름  --> 밑에 qualifier를 넣고, 각 각 repository의 이름붙여주기
                        //아니면 다 지우고, Autowired 쓰고 밑에 userDAO dao;라고 써도 된다
    //@Autowired
    //@Qualifier("udao")
    //MyDao<String, UserDTO> dao;

    //@Autowired

    //UserDAO dao;
    @Qualifier("udao")
    MyDao<String, UserDTO> dao;

    @Override
    public void register(UserDTO userDTO) {
        dao.insert(userDTO);
        System.out.println("Send mail");

    }

    @Override
    public void remove(String s) {
        dao.delete(s);

    }

    @Override
    public void modify(UserDTO userDTO) {
        dao.update(userDTO);
        System.out.println("Send mail");

    }

    @Override
    public UserDTO get(String s) {

        return dao.select(s);
    }

    @Override
    public List<UserDTO> get() {
        return dao.select();
    }
}
