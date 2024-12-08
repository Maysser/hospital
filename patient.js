document.getElementById('patientForm').addEventListener('submit', function (e) {
    e.preventDefault();

    const formData = new FormData(this);

    fetch('save_patient.php', {
        method: 'POST',
        body: formData,
    })
        .then(response => response.text())
        .then(data => {
            alert(data);
            this.reset();
        })
        .catch(error => console.error('Error:', error));
});
