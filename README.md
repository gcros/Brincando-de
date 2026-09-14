# Fan House 3D

Projeto Unity 6.3 LTS preparado para gerar APK Android online pelo GitHub Actions.

## Build online

1. Abra **Settings > Secrets and variables > Actions**.
2. Crie os secrets:
   - `UNITY_LICENSE`
   - `UNITY_EMAIL`
   - `UNITY_PASSWORD`
3. Abra a aba **Actions**.
4. Escolha **Build Fan House Android APK**.
5. Toque em **Run workflow**.
6. Quando terminar, baixe o artifact **FanHouse3D-Android-APK**.

O projeto-fonte está armazenado no repositório em partes dentro de `.fanhouse_bundle/`. O workflow reconstrói automaticamente o ZIP, abre o projeto em Unity 6.3 LTS (`6000.3.24f1`) e gera o APK.
