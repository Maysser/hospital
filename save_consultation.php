<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "hospital_data_base";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$id_patient = $_POST['id_patient'];
$id_medecin = $_POST['id_medecin'];
$date_heure = $_POST['date_heure'];
$diagnostic = $_POST['diagnostic'];
$prescription = $_POST['prescription'];

// Prepare the SQL query with placeholders
$stmt = $conn->prepare("INSERT INTO Consultation (ID_Patient, ID_Médecin, Date_Heure, Diagnostic, Prescription) 
                        VALUES (?, ?, ?, ?, ?)");

// Bind parameters to the prepared statement
$stmt->bind_param("iisss", $id_patient, $id_medecin, $date_heure, $diagnostic, $prescription);

// Execute the statement
if ($stmt->execute()) {
    echo "Consultation ajoutée avec succès!";
} else {
    echo "Erreur: " . $stmt->error;
}

// Close the statement and connection
$stmt->close();
$conn->close();

?>
