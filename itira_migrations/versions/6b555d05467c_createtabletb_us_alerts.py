"""createTableTb_us_alerts

Revision ID: 6b555d05467c
Revises: 003ddc83263e
Create Date: 2020-03-31 14:16:50.117787

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects.mysql import INTEGER as Integer


# revision identifiers, used by Alembic.
revision = '6b555d05467c'
down_revision = '003ddc83263e'
branch_labels = None
depends_on = None


def upgrade(engine_name):
    globals()["upgrade_%s" % engine_name]()


def downgrade(engine_name):
    globals()["downgrade_%s" % engine_name]()





def upgrade_itira_db():
    #    'country_id', 'title', 'levels', ,'level_numbers', 'last_update', 'links'
    op.create_table(
        'td_usa_alerts',
        sa.Column('id', sa.Integer, primary_key=True,nullable=False, unique=True),
        sa.Column('country_id', Integer(unsigned=True), sa.ForeignKey("countries.countryID")),
        sa.Column('title', sa.Text, nullable=False),
        sa.Column('levels', sa.Text, nullable=False),
        sa.Column('level_numbers', sa.Integer, nullable=False),
        sa.Column('last_update', sa.Text, nullable=False),
        sa.Column('links', sa.Text, nullable=False),
        sa.Column('created_at', sa.DateTime(), nullable=False, server_default=sa.text("CURRENT_TIMESTAMP()")),
        sa.Column('modified_at', sa.DateTime(), nullable=False, server_default = sa.text("CURRENT_TIMESTAMP()"))
    )
    op.execute('''
        ALTER TABLE `td_usa_alerts` CHANGE `modified_at` `modified_at` DATETIME on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;           
    ''')
    pass


def downgrade_itira_db():
    pass

