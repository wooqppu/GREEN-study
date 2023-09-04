import React from 'react';

function CreateUser({username, email, onChange, onCreate}) {
    return (
        <div>
            <input name="username" value={username} onChange={onChange} />
            <input name="email" value={email} onChange={onChange} />

            <button onClick={onCreate}>등록</button>
        </div>
    );
}

export default CreateUser;
