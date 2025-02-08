# Snippets

- [VSCode Snippet Generator](https://snippet-generator.app/?description=&tabtrigger=&snippet=&mode=vscode)
- [How to use VSCode snippets with LuaSnip](https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#vs-code)

## Sources

- [ES7+ react snippets](https://github.com/r5n-labs/vscode-react-javascript-snippets)
- [Javascript snippets](https://github.com/xabikos/vscode-javascript)
- [NextJS snippets](https://github.com/pulkitgangwar/next.js-snippets)

### Merge multipe vscode snippets

```js
const fs = require("fs");

const output = "output.json";
const base = "./input/";
const files = fs.readdirSync(base).map((file) => base + file);
const compiledData = files
 .map((file) => JSON.parse(fs.readFileSync(file, { encoding: "utf8" })))
 .reduce((p, c) => ({ ...p, ...c }), {});

fs.writeFileSync(output, JSON.stringify(compiledData, undefined, 2));
```
