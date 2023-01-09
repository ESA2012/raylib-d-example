import raylib;
import raylib.raylib_types;

void main()
{
	// call this before using raylib
	validateRaylibBinding();

	immutable uint screenWidth = 800;
	immutable uint screenHeight = 600;

	SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT);

	InitWindow(screenWidth, screenHeight, "raylib [core] example - 3d camera free");

	auto camera = new Camera3D();
	camera.position = Vector3(10.0f, 10.0f, 10.0f);
	camera.target = Vector3(0.0f, 0.0f, 0.0f);
	camera.up = Vector3(0.0f, 1.0f, 0.0f);
	camera.fovy = 45.0f;
	camera.projection = CameraProjection.CAMERA_PERSPECTIVE;

	auto cubePosition = Vector3(0.0f, 0.0f, 0.0f);

	SetCameraMode(*camera, CameraMode.CAMERA_FREE);

	SetTargetFPS(60);

	while (!WindowShouldClose())
	{
		UpdateCamera(camera);

		if (IsKeyDown('Z')) camera.target = Vector3(0.0f, 0.0f, 0.0f);

		BeginDrawing();

			ClearBackground(Colors.RAYWHITE);

			BeginMode3D(*camera);

				DrawCube(cubePosition, 2.0f, 2.0f, 2.0f, Colors.RED);
				DrawCubeWires(cubePosition, 2.0f, 2.0f, 2.0f, Colors.MAROON);

				DrawGrid(10, 1.0f);

			EndMode3D();

			DrawRectangle( 10, 10, 320, 133, Fade(Colors.SKYBLUE, 0.5f));
			DrawRectangleLines( 10, 10, 320, 133, Colors.BLUE);

			DrawText("Free camera default controls:", 20, 20, 10, Colors.BLACK);
			DrawText("- Mouse Wheel to Zoom in-out", 40, 40, 10, Colors.DARKGRAY);
			DrawText("- Mouse Wheel Pressed to Pan", 40, 60, 10, Colors.DARKGRAY);
			DrawText("- Alt + Mouse Wheel Pressed to Rotate", 40, 80, 10, Colors.DARKGRAY);
			DrawText("- Alt + Ctrl + Mouse Wheel Pressed for Smooth Zoom", 40, 100, 10, Colors.DARKGRAY);
			DrawText("- Z to zoom to (0, 0, 0)", 40, 120, 10, Colors.DARKGRAY);

		EndDrawing();
	}

	CloseWindow();
}
