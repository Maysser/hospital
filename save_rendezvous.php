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

$sql = "INSERT INTO Rendezvous (ID_Patient, ID_Medecin, DateHeure) 
        VALUES ('$id_patient', '$id_medecin', '$date_heure')";

if ($conn->query($sql) === TRUE) {
    echo "Rendez-vous ajouté avec succès!";
} else {
    echo "Erreur: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
