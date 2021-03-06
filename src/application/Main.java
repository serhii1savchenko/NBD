package application;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class Main extends Application {
	@Override
	public void start(Stage primaryStage) {
		try {
			primaryStage.setTitle("Schedule Check");
			Parent root = FXMLLoader.load(getClass().getResource("/view/main.fxml"));

		    primaryStage.setScene(new Scene(root));
			primaryStage.getScene().getStylesheets().add("view/application.css");

			primaryStage.show();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		launch(args);
	}
}
