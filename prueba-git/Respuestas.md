# PracticaGit - Respuestas

--

**1. ¿Qué comando utilizaste en el paso 11? ¿Por qué?**

`git reset --hard HEAD~1` 

Porque así eliminamos el commit. Si hubiésemos utilizado "reset normal" símplemente habríamos dado un paso atrás.

--

**2. ¿Qué comando o comandos utilizaste en el paso 12? ¿Por qué?**

`git reflog`

Buscar el código del paso correspondiente al commit

`git reset --hard a5a05fd` 

Ir al paso del commit en el que se actualizaba el archivo don-quijote.md (a5a05fd)

--

**3. El merge del paso 13, ¿Causó algún conflicto? ¿Por qué?**

`git merge styled`

No. Porque al ponerle estilos al texto no lo hemos modificado, le hemos añadido carácteres, y eso no debería de generar conflicto.

--

**4. El merge del paso 19, ¿Causó algún conflicto? ¿Por qué?**

`git checkout styled`

Para que sea la rama "styled" la que absorba.

`git merge htmlify`

Hacer el merge que causa Conflicto. De una versión a otra la aplicación de estilo cambia de "** **" a "<em> </em>" sustituyendo uno por otro.

--

**5. El merge del paso 21, ¿Causó algún conflicto? ¿Por qué?**

No, se hizo un merge fast-forward.

--

**6. ¿Qué comando o comandos utilizaste en el paso 25?**

`git graph` para generar el gráfico

--

**7. El merge del paso 26, ¿Podría ser fast forward? ¿Por qué?**

Sí, porque ha actualizado la rama añadiendo el título.

--

**8. ¿Qué comando o comandos utilizaste en el paso 27?**

`git reset HEAD~1`

--

**9. ¿Qué comando o comandos utilizaste en el paso 28?**

`git checkout -- don-quijote.md` 

--

**10. ¿Qué comando o comandos utilizaste en el paso 29?**

`git checkout master` para salir a otra rama
`git branch -d title` para eliminar la rama title

--

**11. ¿Qué comando o comandos utilizaste en el paso 30?**

`git reflog`para ver los movimientos
`git reset --hard cceb420` para volver al último movimiento antes del "reset HEAD~1"

--

**12. ¿Qué comando o comandos usaste en el paso 32?**

`git graph` para ver el codigo del primer commit
`git reset --hard 87d5466ae8ebf225ff49b519fdf0b5374c4c715b` cerré la ventana de terminal a medias y tuve que utilizar el código del grafico


--

**13. ¿Qué comando o comandos usaste en el punto 33?**

`git reflog`
`git reset --hard cceb420` 

--