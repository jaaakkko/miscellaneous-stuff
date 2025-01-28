from robot.api import logger
from robot.api.deco import keyword, library

@library
class Queries:

    @keyword
    def generate_stop_query(self, id, *attributes):
        """
        Generates a GraphQL query for fetching stop information.

        :param id: The ID of the stop.\n
        :param attributes: The attributes to fetch for the stop.\n
        :return: The generated GraphQL query as a string.

        Example:
        | ${query} = | Generate Stop Query | HSL:1234 | name | lat | lon |
        | Log | ${query} |
        """
        attributes_str = " ".join(attributes)
        query = f"""
        {{
          stop(id: "{id}") {{
            {attributes_str}
          }}
        }}
        """
        logger.info(query)
        return query