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
$type_intervention = $_POST['type_intervention'];
$date_intervention = $_POST['date_intervention'];
$anesthesie = $_POST['anesthesie'];
$salle = $_POST['salle'];

$sql = "INSERT INTO Intervention (ID_Patient, ID_Medecin, TypeIntervention, DateIntervention, Anesthesie, Salle) 
        VALUES ('$id_patient', '$id_medecin', '$type_intervention', '$date_intervention', '$anesthesie', '$salle')";

if ($conn->query($sql) === TRUE) {
    echo "Intervention ajoutée avec succès!";
} else {
    echo "Erreur: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
