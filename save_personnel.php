<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "hospital_data_base";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$nom = $_POST['nom'];
$prenom = $_POST['prenom'];
$poste = $_POST['poste'];
$service = $_POST['service'];
$telephone = $_POST['telephone'];
$email = $_POST['email'];

$sql = "INSERT INTO Personnel (Nom, Prenom, Poste, Service, Telephone, Email) 
        VALUES ('$nom', '$prenom', '$poste', '$service', '$telephone', '$email')";

if ($conn->query($sql) === TRUE) {
    echo "Personnel ajouté avec succès!";
} else {
    echo "Erreur: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
