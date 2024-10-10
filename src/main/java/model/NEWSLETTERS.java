package model;

public class NEWSLETTERS {
    private String email;
    private boolean enabled;

    // Constructor không tham số
    public NEWSLETTERS() {
    }

    // Constructor có tham số
    public NEWSLETTERS(String email, boolean enabled) {
        this.email = email;
        this.enabled = enabled;
    }

    // Getter và Setter cho email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Getter và Setter cho enabled
    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
}
