package controller;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.stage.Stage;

public class ventanaInicioController {

    private ventanaLoginController controllerVentanaInicio;
    private Stage stage;
    
    @FXML
    private Button btnVerCatalogos;

    @FXML
    private Button btnGenerarTrabajos;

    @FXML
    private Button btnGestionarTrabajos;

    @FXML
    private Button btnCerrarSesion;

    @FXML
    private Label labelUsuario;

    @FXML
    void ventanaLogin(ActionEvent event) {

    }

    void init(String text, Stage stage, ventanaLoginController aThis) {
        labelUsuario.setText(text);
        this.controllerVentanaInicio = controllerVentanaInicio;
        this.stage = stage;
    }

}
