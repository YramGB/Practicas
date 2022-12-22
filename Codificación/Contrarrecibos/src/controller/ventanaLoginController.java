package controller;

import java.io.IOException;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class ventanaLoginController {

    private Stage stage;
    
    @FXML
    private Button btnIniciarSesion;

    @FXML
    private TextField idField;

    @FXML
    private Label labelnicioSesion;

    @FXML
    private PasswordField contraseñaField;

    @FXML
    private Button btnCambiarContraseña;

    @FXML
    private Label LavelSinCuenta;

    @FXML
    void showVentanaInicio(ActionEvent event) throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/view/ventanaInicio.fxml"));
        Parent root = loader.load();
        ventanaInicioController controller = loader.getController();
        Scene scene = new Scene(root);
        Stage stage = new Stage();
        stage.setScene(scene);
        controller.init(idField.getText(), stage, this);
        stage.show();
        this.stage.close();
    }

    public void setStage(Stage stage) {
        this.stage.equals(stage);
    }

}
