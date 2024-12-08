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
$type_examen = $_POST['type_examen'];
$date = $_POST['date'];
$resultats = $_POST['resultats'];

$sql = "INSERT INTO Examen (ID_Patient, ID_Medecin, TypeExamen, Date, Resultats) 
        VALUES ('$id_patient', '$id_medecin', '$type_examen', '$date', '$resultats')";

if ($conn->query($sql) === TRUE) {
    echo "Examen ajouté avec succès!";
} else {
    echo "Erreur: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
