<style>
  form {
    width: 200px;
    margin: auto;
    margin-top: 20px;
  }
  button {
    margin-top: 10px;
    border: none;
    border-radius: 5px;
    width: 80px;
    background-color: rgb(48, 166, 221);
    color: white;
    margin-bottom: 10px;
  }
  input {
    margin-bottom: 10px;
  }
  label {
    margin-bottom: 0;
  }
</style>

<form action="{{mountpathed "register"}}" method="post">
	<label for="{{.primaryID}}">{{ t "register.email" }}</label>
	<input name="{{.primaryID}}" type="text" value="{{with .primaryIDValue}}{{.}}{{end}}" placeholder="{{title .primaryID}}" /><br />
	{{$pid := .primaryID}}{{with .errs}}{{with $errlist := index . $pid}}{{range $errlist}}<span>{{.}}</span><br />{{end}}{{end}}{{end}}
	<label for="password">{{ t "register.password" }}</label>
	<input name="password" type="password" placeholder="Password" /><br />
	{{with .errs}}{{range .password}}<span>{{.}}</span><br />{{end}}{{end}}
	<label for="confirm_password">{{ t "register.confirm_password" }}:</label>
	<input name="confirm_password" type="password" /><br />
	{{with .errs}}{{range .confirm_password}}<span>{{.}}</span><br />{{end}}{{end}}
    <button type="submit">{{ t "register.button" }}</button><br />

	<input type="hidden" name="{{.xsrfName}}" value="{{.xsrfToken}}" />
</form>
