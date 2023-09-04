import { useState } from 'react';
import './App.css';
import Footer from './components/Footer';
import Header from './components/Header';
import Main from './components/Main';
import { DarkContext } from './context/DarkContext';


function App() {
  const [isDark, setIsDark] = useState(false);
  const darkToggle = () => {
    setIsDark(!isDark);
  }

  return (

    <div className="App">
      {/* <Header isDark={isDark} />
      <Main isDark={isDark} />
      <Footer isDark={isDark} darkToggle={darkToggle} /> */}

      <DarkContext.Provider value={{isDark:isDark, darkToggle:darkToggle}}>

      <Header />
      <Main />
      <Footer />

      </DarkContext.Provider>
    </div>

  );
}

export default App;

// 이건 props로 전달한 방식 
// context로 똑같이 전달하기 
