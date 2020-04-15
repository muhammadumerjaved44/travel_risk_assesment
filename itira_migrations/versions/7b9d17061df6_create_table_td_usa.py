"""create_table_td_usa

Revision ID: 7b9d17061df6
Revises: 296a03ee8949
Create Date: 2020-04-07 20:26:03.883378

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects.mysql import INTEGER as Integer


# revision identifiers, used by Alembic.
revision = '7b9d17061df6'
down_revision = '296a03ee8949'
branch_labels = None
depends_on = None


def upgrade(engine_name):
    globals()["upgrade_%s" % engine_name]()


def downgrade(engine_name):
    globals()["downgrade_%s" % engine_name]()





def upgrade_itira_db():
#    'country_id', 'update_date', 'alert_status', 'summary',
#       'alert_details', 'embassy_consulate', 'destination_description',
#       'entry_exit', 'safty_security', 'local_law', 'health',
#       'travel_transport', 'url'
    op.create_table(
        'td_usa',
        sa.Column('id', sa.Integer, primary_key=True,nullable=False, unique=True),
        sa.Column('country_id', Integer(unsigned=True), sa.ForeignKey("countries.countryID")),
        sa.Column('update_date', sa.Text, nullable=False),
        sa.Column('alert_status', sa.Text, nullable=False),
        sa.Column('summary', sa.Text, nullable=False),
        sa.Column('alert_details', sa.Text, nullable=True),
        sa.Column('embassy_consulate', sa.Text, nullable=False),
        sa.Column('destination_description', sa.Text, nullable=False),
        sa.Column('entry_exit', sa.Text, nullable=False),
        sa.Column('safty_security', sa.Text, nullable=False),
        sa.Column('local_law', sa.Text, nullable=False),
        sa.Column('health', sa.Text, nullable=False),
        sa.Column('travel_transport', sa.Text, nullable=False),
        sa.Column('url', sa.Text, nullable=False),
        sa.Column('created_at', sa.DateTime(), nullable=False, server_default=sa.text("CURRENT_TIMESTAMP()")),
        sa.Column('modified_at', sa.DateTime(), nullable=False, server_default = sa.text("CURRENT_TIMESTAMP()")),
    )
    op.execute('''
        ALTER TABLE `td_usa` CHANGE `modified_at` `modified_at` DATETIME on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;           
    ''')
    pass


def downgrade_itira_db():
    pass

