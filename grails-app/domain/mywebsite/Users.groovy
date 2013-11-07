package mywebsite

class Users {
    String username;
    String password;
    String email;
    String registerreason;
    String truename;
    Date birthday;
    String phone;
    String qq;
    String question;
    static constraints = {
        username(unique: true)
        password(blank: false)

    }
}
