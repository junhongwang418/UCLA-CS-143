<html>
	<head>
		<title>CS 143 Project 1 | Junhong Wang</title>
	</head>
	<body>

		<?php

			function isQueryAvailable() {
				return isset($_GET["query"]) && !empty($_GET["query"]);
			}

			function getQuery() {
				return $_GET["query"];
			}

			function showResource($query) {

				echo "<h3>Results from MySQL:</h3>";

				// establish connection
				$connection_handler = mysql_connect("localhost", "cs143", "");
				if (!$connection_handler) {
					echo "Could not connect: " . mysql_error();
					return;
				}

				// select database
				if (!mysql_select_db("CS143", $connection_handler)) {
					echo mysql_errno($connection_handler) . ": " . mysql_error($connection_handler) . "\n";
					// close connection
					mysql_close($connection_handler);
					return;
				}

				// issue query
				$resource = mysql_query($query, $connection_handler);
				if (!$resource) {
					echo mysql_errno($connection_handler) . ": " . mysql_error($connection_handler) . "\n";
					// close connection
					mysql_close($connection_handler);
					return;
				}

				// close connection
				mysql_close($connection_handler);
				
				// echo table
				echo '<table border="1" cellspacing="1" cellpadding="2">';
				echo '<tbody>';

				//// echo table header
				echo '<tr align="center">';

				$numCols = mysql_num_fields($resource);
				
				for ($i = 0; $i < $numCols; $i++) {
					echo '<td><b>' . mysql_field_name($resource, $i) . '</b></td>';
				}

				echo '</tr>';

				//// echo table rows
				while($row = mysql_fetch_row($resource)) {
					echo '<tr align="center">';
					for ($i = 0; $i < $numCols; $i++) {

						if (is_null($row[$i])) {
							echo '<td>' . "N/A" . '</td>';
						}
						else {
							echo '<td>' . $row[$i] . '</td>';
						}
					}
				}

				echo '</tbody>';
				echo '</table>';

			}

		?>

		<h1>CS 143 Project 1 - Junhong Wang</h1>
		<p>Type an SQL query in the following box:</p>
		<p>Example: <tt>SELECT * FROM Actor WHERE id=10;</tt></p>
		<form action="query.php" method="GET">
			<textarea name="query" cols="60" rows="8"></textarea>
			<br />
			<input type="submit" values="Submit" />
		</form>
		<p>
			<small>Note: tables and fields are case sensitive.</small>
		</p>

		<?php

			if (isQueryAvailable()) {
				$query = getQuery();
				showResource($query);
			}

		?>

	</body>
</html>