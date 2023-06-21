const { test, expect } = require("@playwright/test");
// const { MarkdownPage } = require("../support/markdown-page");

test.describe.parallel("LHS sidebar (site-wide ToC)", () => {
  test("shows sidebar on a page", async ({ page }) => {
    // const Page = new MarkdownPage(page);
    // await Page.goto("/fixturepage");
    // await Page.getData();
    await page.goto("/fixture-page");

    await expect(page.getByTestId("lhs-sidebar")).toBeVisible();
  });

  test("doesn't show sidebar on a page with disabled sidebar", async ({
    page,
  }) => {
    // const Page = new MarkdownPage(page);
    // await Page.goto("/");
    // await Page.getData();
    await page.goto("/");

    await expect(page.getByTestId("lhs-sidebar")).toBeHidden();
  });

  test("can navigate to a listed page", async ({ page }) => {
    // const Page = new MarkdownPage(page);
    // await Page.goto("/fixturepage");
    // await Page.getData();
    await page.goto("/fixture-page");

    await page
      .getByTestId("lhs-sidebar")
      .getByText("Conquer the puddles")
      .click();
    await expect(page).toHaveURL("/blogtest");
  });

  test("correctly renders a page with spaces in file name and no title", async ({ page }) => {
    await page.goto("/fixture-page");
    const sidebar = page.getByTestId("lhs-sidebar")

    await expect(sidebar.getByText("Some%20Page%20With%20Spaces%20And%20No%20Title")).toHaveCount(0);

    const link = sidebar.getByText("Some Page With Spaces And No Title");
    await expect(link).toHaveCount(1);
    await link.click();
    await expect(page).toHaveURL("/Some%20Page%20With%20Spaces%20And%20No%20Title");
  });

  test("correctly groups pages in the sidebar", async ({ page }) => {
    await page.goto("/fixture-page");
    const sidebar = page.getByTestId("lhs-sidebar")

    const groupButton = sidebar.getByRole("button", { name: "Sidebar Group Test" });
    await expect(groupButton).toHaveCount(1);
    await groupButton.click();

    // const group = page.locator("button").filter({ has: groupButton });
    // await expect(group).toHaveCount(1);
    // const groupElements = group.locator('div');
    // await expect(groupElements).toHaveCount(3);

    const nestedGroupButton = sidebar.getByRole("button", { name: "Nested Group" });
    await expect(nestedGroupButton).toHaveCount(1);
    // await nestedGroupButton.click();

    // const nestedGroup = groupElements.getByRole("div").filter({ has: nestedGroupButton });
    // const nestedGroupElements = nestedGroup.locator('div');
    // await expect(nestedGroupElements).toHaveCount(2);
  });
});
