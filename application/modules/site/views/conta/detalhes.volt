{{ flashSession.output() }}

<style>
    .error{ color: #FF4961; }
    .success{ color: #28D094; }
</style>

<main class="woocommerce-EditAccountForm edit-account">

   <fieldset id="section1">
       <a href="#section2" id="hash1"></a>
       <legend>Informações principais</legend>

       <form id="update_main">
           <p class="woocommerce-form-row woocommerce-form-row--first form-row form-row-first">
               <label for="account_first_name">Nome&nbsp;<span class="required">*</span></label>
               <input required type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="account_first_name" id="account_first_name" autocomplete="given-name" value="{{ usuario.nome }}">
           </p>
           <p class="woocommerce-form-row woocommerce-form-row--last form-row form-row-last">
               <label for="account_last_name">Sobrenome&nbsp;<span class="required">*</span></label>
               <input required type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="account_last_name" id="account_last_name" autocomplete="family-name" value="{{ usuario.sobrenome }}">
           </p>
           <p class="woocommerce-form-row woocommerce-form-row--first form-row form-row-first">
               <label for="account_first_name">DDD&nbsp;<span class="required">*</span></label>
               <input required type="number" class="woocommerce-Input woocommerce-Input--text input-text" name="account_first_name" id="account_ddd" autocomplete="given-name" value="{{ usuario.contato["ddd"] is defined ? usuario.contato["ddd"] : '' }}">
           </p>
           <p class="woocommerce-form-row woocommerce-form-row--last form-row form-row-last">
               <label for="account_last_name">Telefone&nbsp;<span class="required">*</span></label>
               <input required type="text" maxlength="9" class="woocommerce-Input woocommerce-Input--text input-text" name="account_last_name" id="account_telefone" autocomplete="family-name" value="{{ usuario.contato["telefone"] is defined ? usuario.contato["telefone"] : '' }}">
           </p>
           <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-first">
               <label for="account_email">CPF&nbsp;<span class="required">*</span></label>
               <input required type="text" maxlength="14" class="woocommerce-Input woocommerce-Input--email input-text" name="account_email" id="account_document" autocomplete="email" value="{{ usuario.documento["valor"] is defined ? usuario.documento["valor"] : '' }}">
           </p>
           <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-last">
               <label for="account_email">Data de nascimento&nbsp;<span class="required">*</span></label>
               <input required type="text" class="woocommerce-Input woocommerce-Input--email input-text" name="account_nascimento" id="account_nascimento" autocomplete="email" value="{{ usuario.nascimento is defined ? usuario.nascimento : '' }}">
           </p>
           <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
               <label for="account_email">Email&nbsp;<span class="required">*</span></label>
               <input required type="email" class="woocommerce-Input woocommerce-Input--email input-text" disabled name="account_email" id="account_email" autocomplete="email" value="{{ usuario.email }}">
           </p>

           <p>
               <button type="submit" class="woocommerce-Button button" name="save_account_details" value="Save changes">Salvar</button>
               <p id="log_update_main"></p>
           </p>
       </form>

   </fieldset>
    <div class="clear"></div>

   <fieldset id="section2">
       <a href="#section3" id="hash2"></a>
       <legend>Endereço</legend>

       <form id="update_address">
           <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-first">
               <label for="account_display_name">CEP&nbsp;<span class="required">*</span></label>
               <input required type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="account_cep" id="account_cep" value="{{ usuario.endereco["cep"] }}">
           </p>

           <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-last">
               <label for="account_display_name">Rua&nbsp;<span class="required">*</span></label>
               <input required readonly type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="account_rua" id="account_rua" value="{{ usuario.endereco["rua"] }}">
           </p>

           <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-first">
               <label for="account_display_name">Bairro&nbsp;<span class="required">*</span></label>
               <input required readonly type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="account_bairro" id="account_bairro" value="{{ usuario.endereco["bairro"] }}">
           </p>

           <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-last">
               <label for="account_display_name">Cidade&nbsp;<span class="required">*</span></label>
               <input required readonly type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="account_localidade" id="account_localidade" value="{{ usuario.endereco["cidade"] }}">
           </p>

           <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-first">
               <label for="account_display_name">UF&nbsp;<span class="required">*</span></label>
               <input required readonly type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="account_uf" id="account_uf" value="{{ usuario.endereco["estado"] }}">
           </p>

           <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-last">
               <label for="account_display_name">Número&nbsp;<span class="required">*</span></label>
               <input required type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="account_numero" id="account_numero" value="{{ usuario.endereco["numero"] }}">
           </p>

           <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
               <label for="account_display_name">Complemento&nbsp;<span class="required"></span></label>
               <input type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="account_complemento" id="account_complemento" value="{{ usuario.endereco["complemento"] }}">
           </p>

           <p>
               <button type="submit" class="woocommerce-Button button" name="save_account_details">Salvar</button>
               <p id="log_update_address"></p>
           </p>

       </form>

   </fieldset>
    <div class="clear"></div>

    <fieldset id="section3">
        <legend>Alterar senha</legend>

        <form id="update_password">
            <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                <label for="password_current">Senha atual <span class="required">*</span></label>
                <input required type="password" class="woocommerce-Input woocommerce-Input--password input-text" name="password_current" id="password_current" autocomplete="off">
            </p>
            <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-first">
                <label for="password_1">Nova senha&nbsp;<span class="required">*</span></label>
                <input required type="password" class="woocommerce-Input woocommerce-Input--password input-text" name="password_1" id="password_1" autocomplete="off">
            </p>
            <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-last">
                <label for="password_2">Confirmar nova senha&nbsp;<span class="required">*</span></label>
                <input required type="password" class="woocommerce-Input woocommerce-Input--password input-text" name="password_2" id="password_2" autocomplete="off">
            </p>

            <p>
                <button type="submit" class="woocommerce-Button button" name="save_account_details" value="Save changes">Salvar</button>
                <p id="log_update_password"></p>
            </p>

        </form>

    </fieldset>
    <div class="clear"></div>

</main>