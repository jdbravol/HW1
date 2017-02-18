package webapp;

import com.google.appengine.api.users.User;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class UserEntity{
    @Id Long id;
    User u;
    private UserEntity(){}

    public User getUser(){
        return u;
    }
}
