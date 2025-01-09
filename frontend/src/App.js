import React, { useEffect, useState } from 'react';
import axios from 'axios';

function App() {
  const [message, setMessage] = useState('');

  useEffect(() => {
    const apiUrl = `http://${process.env.BACKEND_SERVER}:8080/api/message`
    
    axios.get(apiUrl)
      .then(response => {
        setMessage(response.data.message);
      })
      .catch(error => {
        console.error('Error fetching the message:', error);
      });
  }, []);

  return (
    <div>
      <h1>{message ? message : 'Loading...'}</h1>
    </div>
  );
}

export default App;