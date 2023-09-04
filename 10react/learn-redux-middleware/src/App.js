import './App.css';
import Counter from './components/Counter';
import PostList from './components/PostList';
import { Route, Routes } from 'react-router-dom';
import PostListPage from './pages/PostListPage';
import PostPage from './pages/PostPage';

function App() {
  return (
    <div className="App">
      <Counter/>
      
      <Routes>
        <Route path="/" element={<PostListPage />} />
        <Route path="/:id" element={<PostPage />} />
      </Routes>
    </div>
  );
}

export default App;
