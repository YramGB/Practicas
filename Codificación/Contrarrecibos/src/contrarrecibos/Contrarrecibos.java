package contrarrecibos;

import controller.ventanaLoginController;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class Contrarrecibos extends Application {
    
    @Override
    public void start(Stage stage) throws Exception {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/view/ventanaLogin.fxml"));
        Parent root = loader.load();
        Scene scene = new Scene(root);
        stage.setScene(scene);
        ventanaLoginController controller = loader.getController();
        controller.setStage(stage);
        stage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }      
}