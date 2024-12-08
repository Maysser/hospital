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
$nom_medicament = $_POST['nom_medicament'];
$dosage = $_POST['dosage'];
$duree = $_POST['duree'];
$date_prescription = $_POST['date_prescription'];

$sql = "INSERT INTO Traitement (ID_Patient, ID_Medecin, NomMedicament, Dosage, Duree, DatePrescription) 
        VALUES ('$id_patient', '$id_medecin', '$nom_medicament', '$dosage', '$duree', '$date_prescription')";

if ($conn->query($sql) === TRUE) {
    echo "Traitement ajouté avec succès!";
} else {
    echo "Erreur: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
