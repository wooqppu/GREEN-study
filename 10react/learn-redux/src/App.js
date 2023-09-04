import './App.css';
import CounterContainer from './components/CounterContainer';
import TodosContainer from './components/TodosContainer';

function App() {
  return (
    <div className="App">
      <CounterContainer />
      <h2>TodoList</h2>
      <TodosContainer />
    </div>
  );
}

export default App;
