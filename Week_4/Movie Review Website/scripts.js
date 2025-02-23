
const searchInput = document.getElementById('search-input-navbar');
const searchButton = document.getElementById('search-button-navbar');
const resultsContainer = document.getElementById('search-results'); // New div to display results


const movies = [
    'Batman',
    'Interstellar',
    'Top Gun Maverick',
    'Inception',
    'The Dark Knight',
    'Avatar',
    'The Matrix',
    'Titanic'
];

function searchMovies() {
    const query = searchInput.value.toLowerCase(); 
    const results = movies.filter(movie => movie.toLowerCase().includes(query)); 

    
    resultsContainer.innerHTML = '';

    if (results.length > 0) {
        results.forEach(movie => {

            const movieElement = document.createElement('div');
            movieElement.classList.add('search-result');
            movieElement.textContent = movie;
            resultsContainer.appendChild(movieElement);
        });
    } else {
        
        resultsContainer.textContent = 'No movies found.';
    }
}


searchButton.addEventListener('click', searchMovies);


searchInput.addEventListener('keypress', (event) => {
    if (event.key === 'Enter') {
        searchMovies();
    }
});
