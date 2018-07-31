<p>Bem-vindo,
    <strong>{{ usuario.nome is defined ? usuario.nome : 'Anônimo' }}</strong>
</p>
<p>Esta é a sua área administrativa, onde você conseguira visualizar os seus
    <a href="{{ url.getBaseUri() }}conta/pedidos">pedidos</a>
    e também gerenciar suas
    <a href="{{ url.getBaseUri() }}conta/detalhes">informações</a>.
</p>